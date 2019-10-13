// Replace the <textarea id="editor"> with a CKEditor
// instance, using default configuration.
CKEDITOR.replace( 'contents',{
    filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do'
} );

window.addEventListener('DOMContentLoaded', function(){
	//이벤트 처리
    const writeActBtn = document.querySelector("#writeActBtn"); //submit 버튼
	writeActBtn.addEventListener("click",handleSubmit);
  	
});

//submit 전 최종작업
function handleSubmit(){
	event.preventDefault(); //submit의  기본 동작을 막는다.
	//분류[머리말]
	const preface = document.querySelector("select[name=preface]").value;
	//제목
	const title = document.querySelector("input[name=title]").value;
	//내용
	const contents=CKEDITOR.instances.editor.getData();
	//추후에 필요할 내용입력하는것
	//CKEDITOR.instances.editor.setData(''); //태그포함입력
	let is_public = document.querySelector("input[name=is_public]").checked; //공개
	let permit_reply = document.querySelector("input[name=permit_reply]").checked; //댓글허용
	is_public=is_public == true ? 'Y':'N';
	permit_reply=permit_reply == true ? 'Y':'N';
	
	//태그
	let tagValue = marginTag(); //Tag값 array로 변환		
	const writeData = {
		"preface":preface,
		"title":title,
		"contents":contents,
		"tags":tagValue,
		"is_public":is_public,
		"permit_reply":permit_reply
	};
	
	fetch("/articles/"+pageFlag, {
		method: "POST",
		headers: {
            'Content-Type': 'application/json'
            //'Content-Type': 'application/x-www-form-urlencoded'
        },
        credentials: "same-origin",
		body: JSON.stringify(writeData)
	})
	.then((response) => {
		console.log(response);
		if(response.status === 200 || response.status === 201){ //요청성공 시
			response.json()
			.then((json) =>{ 
				if(json.result=="success") alert('글 등록에 성공하였습니다.');
				else {
					alert("글 등록에 실패하였습니다. Error code : 보여주기");
				}
			});
		}
	})
	.catch(error => console.error('error:',error)); //요청에러 시 에러 로그 출력
	
}

/* ↓태그 관련↓  */
let tag={}; //태그가 들어갈 Object
let counter=0; //태그 갯수

//tag Object에 태그 추가
function addTag(value){
    tag[counter]=value; //태그를 Object안에 add
    counter++; //counter증가
}

 //최종적으로 서버에 넘길때 Object -> array로 변환하여 넘기며, 값이 비어있는 것을 걸러낸다.
function marginTag(){
    //Object.value() -> Object를 Array로 변환
    return Object.values(tag).filter(function(word){
        //Array.filter는 주어진 함수의 테스트를 통과하는 모든 요소를 모아 새로운 배열로 반환
        return word !== "";
    });
}

//화면에 태그 추가
$("#tag").on("keypress",function(e){
    let self = $(this);
    
    //태그입력창에서 enter또는 스페이스바 입력 시
    if (e.key === "Enter" || e.keyCode === 32) {
        let tagValue = self.val(); //태그값
        if(tagValue!==""){
            //입력된 값과 현재 등록된 태그값을 비교하여 같은 값이 있는지 비교한 후 해당 값이 있다면 해당 값이array로 return 된다.
            let result = Object.values(tag).filter(function(word){
                return word === tagValue;
            });

            //태그 중복검사
            if(result.length == 0){
                $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='tag-del-btn' idx='"+counter+"'>x</span></li>");
                addTag(tagValue);
                self.val("");
            }else{
                self.val("");
                alert('태그값이 중복됩니다.');
            }
        }
        e.preventDefault();
    }
});

//태그 삭제
$(document).on("click", ".tag-del-btn", function(e){
    let index = $(this).attr("idx");
    tag[index] = "";
    $(this).parent().remove();
});