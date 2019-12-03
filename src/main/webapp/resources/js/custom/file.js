/**
 * 파일 업로드 및 삭제 관련
 */

const regex = new RegExp("(.*?)\.(exe|sh|alz)$"); //제외시킬 확장자명 정규식
const maxSingleFileSize = 20971520; //20MB 하나의 파일이 업로드될 수 있는 최대 크기
const maxFilesSize = 52428800; //50MB 모든 파일크기가 이 값을 넘을 순 없다.
let sumFilesSize=0; //파일 예외처리 할 때 모든 파일 사이즈의 합
let idx=0; //파일의 일련번호라고 생각하면됨.
let cloneUploadDiv; //<input type='file'> 초기화를 위한 초기 아무것도 없는 복제DOM
window.addEventListener('DOMContentLoaded', function(){
	/* const inputFile = document.querySelector("input[name='uploadFile']");
	inputFile.addEventListener("change",fileUploadHandler); */
	const uploadDiv=document.querySelector("div.upload-panel");
	uploadDiv.addEventListener("change",function(e){
		const target = e.target;
		if(target.name=="uploadFile"){
			fileUploadHandler(target);
		}
	});
	cloneUploadDiv = document.querySelector("div.uploadDiv").cloneNode(true);
});

//파일 업로드 핸들러 함수
function fileUploadHandler(target){
	const files = target.files;
	sumFilesSize=0; //파일 업로드함수가 호출될 때 마다 이 값은 초기화 되어야한다.
	
	for(let i=0; i<files.length; i++){
		if(!checkExtension(files[i].name, files[i].size)){//예외처리
			console.log("file upload failed:"+files[i].name)
			return false;
		}
		previewHandler(files[i],idx);
		
		files[i].target=idx;//파일을 특정할 수 있는 번호 부여
		idx++; 
		fileUplaod(files[i]);
	}
}

//실제로 파일 업로드하는 함수
function fileUplaod(file){
	const formData = new FormData();
	formData.append("uploadFile",file);
	const thumb=file.dom[0]; //파일 썸네일, progressbar, 'x'버튼 DOM
	let progressbar=thumb.querySelector("progress");
	
	const url = '/files';
	const xhr = new XMLHttpRequest();
	xhr.upload.onprogress = function (e){
		let percent = e.loaded * 100 / e.total;
		setProgress(progressbar,percent);
		//100%모두 업로드 되었다면 서버에서 file이 생성되고, DB에 insert되고 하는 시간동안 'x'버튼을 사라지게한다.
		//만약에 'x'버튼이 사라지지않아서 그 시간안에 사용자가 'x'버튼을 누르면 오류가 날 가능성이 매우 커진다.
		if(percent==100) thumb.querySelector("img.close").style.display = 'none';
	}
	xhr.onload=function(){
		if (xhr.status === 200 || xhr.status === 201) {
		    const result = JSON.parse(xhr.responseText); //서버에서 온 응답
		    console.log(result);
		    //IE11 미만 호환성
		    thumb.setAttribute("data-fileType",result.fileType);
		    thumb.setAttribute("data-originalFile",result.originalFile);
		    thumb.setAttribute("data-uploadPath",result.uploadPath);
		    thumb.setAttribute("data-uuid",result.uuid);
		    thumb.setAttribute("data-fileSize",result.fileSize);
		   /*IE11 이상
		   	thumb.dataset.fileType=result.fileType;
		    thumb.dataset.originalFile=result.originalFile;
		    thumb.dataset.uploadPath=result.uploadPath;
		    thumb.dataset.uuid=result.uuid; 
		    */
		    //cloneUploadDiv- <input type='file'> 초기화를 위한 코드
		    const uploadDiv=document.querySelector("div.uploadDiv");
		    const uploadDivParent=document.querySelector("div.uploadDiv").parentNode;
		    uploadDivParent.removeChild(uploadDiv);
		    uploadDivParent.appendChild(cloneUploadDiv);
		}else {
			alert("file upload error");
			console.error(xhr.responseText);
		}
		//서버에서 응답이 오면 success든 fail이든 'x'버튼은 보이게해준다.
		thumb.querySelector("img.close").style.display = 'initial';
	};
	xhr.open('post', url, true);
    xhr.send(formData);
    
    //'x'버튼을 눌렀을 때 전송중지하기 위한 이벤트 등록
    const close=file.dom[0].querySelector("img.close");
    close.addEventListener("click",function(){attachFileDelHandler(xhr,file.dom[0]);});
}

//'x' 버튼을 눌렀을 때 전송중지 및 이미 업로드된 파일 삭제(서버에서도 삭제)
function attachFileDelHandler(xhr,thumb){
	xhr.abort(); //요청중단
	
	//server에 이미 업로드 되었다면 업로드된 파일 삭제(DB,실제파일,이미지파일이라면 썸네일포함)
	if(thumb.dataset.uuid != null){
		const delFile={ //param
			originalFile:thumb.dataset.originalfile,
			fileType:thumb.dataset.filetype,
			uploadPath:thumb.dataset.uploadpath,
			uuid:thumb.dataset.uuid
		};
		
		fetch("/files", {
			method: "DELETE",
			headers: {'Content-Type':'application/json'},
	        credentials: "same-origin",
			body: JSON.stringify(delFile)
		}).then((response) => {
			if(response.status === 200 || response.status === 201){ //요청성공 시
				return response.text().then(function(text) {
					if(text=="success"){ //삭제 성공
						thumb.parentNode.removeChild(thumb); //삭제되었으므로 thumb도 DOM에서 삭제
					}else if(text=="fail"){ //삭제 실패
						alert("파일  삭제 실패");
					}
				});
			}
		}).catch(error => console.error('error:',error)); //요청에러 시 에러 로그 출력
	}else{ //server에 올라가기 전에 abort 시켰다면 DOM에서만 삭제시켜준다.
		thumb.parentNode.removeChild(thumb); //삭제되었으므로 thumb도 DOM에서 삭제
	}
}

//파일 미리보기 핸들러
function previewHandler(file,idx){
	const type = file.type;
	console.log("file type:"+type);
	if(type.indexOf('image')>-1)
		previewImage(file,idx);
	else
		previewFile(file,idx,type);
}

//파일 썸네일 생성
function previewFile(file,idx,type){
	let icon="";
	if(type.indexOf('ms-excel')>-1 || type.indexOf('spreadsheetml')>-1) //엑셀, 스프레드 시트
		icon='<img class="icon" src="/resources/icon/excel-240.png" />';
	else if(type.indexOf('presentationml.presentation')>-1) //ppt
		icon='<img class="icon" src="/resources/icon/powerpoint-240.png" />';
	else if(type.indexOf('wordprocessingml.document')>-1) //word
		icon='<img class="icon" src="/resources/icon/word-240.png" />';
	else if(type.indexOf('text/html')>-1) //html
		icon='<img class="icon" src="/resources/icon/HTML-512.png" />';
	else //그 외
		icon='<img class="icon" src="/resources/icon/File-512.png" />';
	
	let $html = $('<div class="thumb" data-idx="' + idx + '"> \
			' + icon + ' \
		<div class="fileName" data-toggle="tooltip" data-placement="top">\
			<span>' + file.name + '</span>\
		</div>\
		<progress class="fileUploadprogress" value="0" max="100" ></progress>\
		<img class="close" src="/resources/icon/file_del-256.png" data-idx="' + idx + '"/> \
		</div>');
	$("#thumbnails").append($html);
	$html.find(".fileName").attr("title",file.name); //html에다가 쓰면 띄어쓰기 때문에 제대로 안나옴. 이렇게 따로해줘야함.
	file.dom=$html;
}

//이미지 썸네일 생성
function previewImage(file,idx){
	//바닐라 자바스크립트로 짠 코드는 evernote '코드모음'에 있으니 보려면 거기로 가야함.						
	//문자열의 뒤에 '\' 를 사용한것은 es5 형식의 멀티 라인 문자열을 의미합니다. '\' 뒤에는 space를 포함한 아무런 문자가 없어야 합니다.
	let $html = $('<div class="thumb" data-idx="' + idx + '">\
	<div class="fileName" data-toggle="tooltip" data-placement="top">\
		<span>' + file.name + '</span>\
	</div>\
	<progress class="fileUploadprogress" value="0" max="100" ></progress>\
	 	<img class="close" src="/resources/icon/file_del-256.png" data-idx="' + idx + '"/> \
	</div>');
	$("#thumbnails").append($html);
	$html.find(".fileName").attr("title",file.name); //html에다가 쓰면 띄어쓰기 때문에 제대로 안나옴. 이렇게 따로해줘야함.
	
	const reader = new FileReader();
	reader.onload=(function(f,idx){
		return function(e){
			document.querySelectorAll(".thumb").forEach(function(item){
				if(item.dataset.idx==idx){
					let html = '<img class="icon" src="' + e.target.result + '" />';
					$(item).prepend(html);
				}
			});
		}
	})(file, idx);
	reader.readAsDataURL(file);
	file.dom=$html;
}

/*	
	프로그래스 바 진행률 표시
	@param progressbar:프로그래스 바 객체
	@param percent:진행률 
*/
function setProgress(progressbar,percent){
	progressbar.value=percent;
}

//파일 예외처리 함수
function checkExtension(fileName, fileSize){
	if(fileSize >= maxSingleFileSize){ //단일 파일 사이즈 측정
		alert(`${fileName} 파일 사이즈 초과 ${fileSize} / ${maxSingleFileSize}`);
		console.log(`${fileName} 파일 사이즈 초과 ${fileSize}/${maxSingleFileSize}`);
		return false;
	}
	if(regex.test(fileName)){ //파일의 확장자명 검사
		alert(`${fileName}과 같은 확장자는 업로드할 수 없습니다.`);
		console.log(`${fileName}과 같은 확장자는 업로드할 수 없습니다.`);
		return false;
	}
	sumFilesSize+=fileSize;
	if(sumFilesSize>=maxFilesSize){
		alert(`모든 파일의 합이 최대 용량을 초과합니다. ${sumFilesSize}/${maxFilesSize}`);
		console.log(`모든 파일의 합이 최대 용량을 초과합니다. ${sumFilesSize}/${maxFilesSize}`);
		return false;
	}
	return true;
}