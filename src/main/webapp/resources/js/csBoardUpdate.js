/**
 * 
 */
 
$(".imageDiv").on("click", "button", function() {
	if(event.target.classList.contains("imgDeleteBtn") == false) return;
	
	event.target.parentElement.remove();
	$("#" + event.target.dataset.info).remove();
});

$(document).ready(function() {
	$(".file").attr("for", "file" + obj.count);
	$(".fileDiv").append("<input type='file' id='file" + obj.count + "' name='file[" + obj.count + "]' class='btn btn-default btn-upload '>")
});

$(".fileDiv").on("change", "input[type='file']", function() {

    readURL(this); //this는 #file자신 태그를 의미
});

function readURL(input) {
	if (input.files && input.files[0]) {
		
        /* 파일 업로드 */
        var file = input.files[0].name;
        file = file.slice(file.lastIndexOf(".", file.length) + 1 , file.length); // 파일 확장자
        
        console.log(file);
        
        if(file != 'png' && file != 'jpg' && file != 'bmp'){
            alert("이미지 파일형태만 등록가능 합니다(jpg, png, bmp)");
            $("#file" + obj.count).val('');
            return;
        } else if (file == '' || file == null){
            alert("이미지 파일형태만 등록가능 합니다(jpg, png, bmp)");
            $("#file" + obj.count).val('');
            return;
        } else {
            var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
            //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
            reader.readAsDataURL(input.files[0]); 
            
            $(".imageDiv").append(
        			"<div class='content-view-img'>" +
        			"<img src='view/${imageList.ni_Path }/${imageList.ni_Name}' alt='이미지' class='fileImg[" + obj.count + "]'>" +
        			"<button type='button' class='imgDeleteBtn' data-info='file" + obj.count + "'>x</button>" +
        			"</div>"
        	);
            
            reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                $("img[class='fileImg[" + obj.count + "]']").attr("src", event.target.result); 
                $("#file" + obj.count)[0].files = input.files;
                obj.count++;
                $(".fileDiv").append("<input type='file' id='file" + obj.count + "' name='file[" + obj.count + "]' class='btn btn-default btn-upload '>");
                $("label[class='file']").attr("for", "file" + obj.count);
            }
        }
	}
}