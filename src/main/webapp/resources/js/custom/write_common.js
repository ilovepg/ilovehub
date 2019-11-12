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
	const preface = document.querySelector("select[name=preface]").value; //분류[머리말]
	const title = document.querySelector("input[name=title]").value; //제목
	const contents=CKEDITOR.instances.editor.getData(); //내용
	
	//필수 예외처리
	const exceptionResult=essentialException(preface,classificationCode,title,contents);
	if(!exceptionResult) return ;
	
	//추후에 필요할 내용입력하는것
	//CKEDITOR.instances.editor.setData(''); //태그포함입력
	let isPublic = document.querySelector("input[name=is_public]").checked; //공개
	let permitReply = document.querySelector("input[name=permit_reply]").checked; //댓글허용
	isPublic=isPublic == true ? 'Y':'N';
	permitReply=permitReply == true ? 'Y':'N';
	const attachFiles=getAttahFile();
	//태그
	let tagValue = marginTag(); //Tag값 array로 변환		
	const writeData = {
		"preface":parseInt(preface), //int값으로 변경->vo안에 vo가 있으므로 Spring에서 자동으로 형변환을 못해주는듯
		"classificationCode":classificationCode, //Spring에서 자동으로 String->int값으로 형반환해줌
		"title":title,
		"contents":contents,
		"tags":tagValue,
		"isPublic":isPublic,
		"permitReply":permitReply,
		"attachFiles":attachFiles
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

//필수 예외처리 - DB에 not null인것들 null로 넘어갈 수 없게 처리
function essentialException(preface,classificationCode,title,contents){
	//분류를 선택하지 않았을 때
	if(preface=="" || preface==null || preface==undefined){
		alert("분류를 선택해주세요.");
		document.querySelector("select[name=preface]").focus();
		return false;
	}
	//게시글 분류코드가 없을때 [서버에러일 확률이 매우 높음]
	if(classificationCode=="" || classificationCode==null || classificationCode==undefined){
		alert("게시글 분류가 올바르지 않습니다. 서버 에러입니다. 관리자에게 문의 또는 새로고침을 해주세요.");
		return false;
	}
	//제목이 입력되지 않았을 때
	if(title=="" || title==null || title==undefined){
		alert("제목을 입력해주세요.");
		document.querySelector("input[name=title]").focus();
		return false;
	}
	//게시글 내용이 입력되지 않았을때[띄어쓰기만 되었을 때, 개행만 되었을 때 는 잡아내지 못하는 문제]
	if(contents=="" || contents==null || contents==undefined){
		alert("내용을 입력해주세요.");
		CKEDITOR.instances.editor.focus();
		return false;
	}
	//글쓴이가 없을때 [세션이 살아있는 동안에만 글을 쓸 수 있도록]
	
	return true;
}

//thumbnail에 있는 파일 정보를 가져와서 서버로 업로드한다.
function getAttahFile(){
	let attachFiles=[];
	const thumbs=document.querySelectorAll("div#thumbnails div.thumb");
	thumbs.forEach(function(item,index){
		const file={
			"uploadPath":item.dataset.uploadpath,
			"uuid":item.dataset.uuid,
			"originalFile":item.dataset.originalfile,
			"fileType":item.dataset.filetype,
			"fileSize":item.dataset.filesize
		};
		attachFiles.push(file);
	});
	return attachFiles;
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