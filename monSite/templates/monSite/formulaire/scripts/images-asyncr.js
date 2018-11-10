{% load myfilters %}

var csrf_token="{{ csrf_token }}";

// file drag hover
function FileDragHover(e) {
	e.stopPropagation();
	e.preventDefault();
}

function FileSelectHandler(e) {
	// cancel event and hover styling
	FileDragHover(e);
	// fetch FileList object
	var files = e.target.files;// || e.dataTransfer.files;
	if (files.length > 1){return;};
	// f = files[0];
	// process all File objects
	for (var i = 0, f; f = files[i]; i++) {
		//ParseFile(f);
		UploadFile(f, e.target, false);
	}
}
function init_upimage(num) {
	var fileselect = $id("id_upimage-"+num+"-ima_file"),
        filedrag = fileselect;
	// file select
	fileselect.addEventListener("change", FileSelectHandler, false);
	// file drop
	filedrag.addEventListener("dragover", FileDragHover, false);
	filedrag.addEventListener("dragleave", FileDragHover, false);
	filedrag.addEventListener("drop", FileSelectHandler, false);
	//filedrag.style.display = "block";
}

function progressHandler(e) {
    var done = e.position || e.loaded
    var total = e.totalSize || e.total;
    console.log('xhr progress: ' + Math.round(done/total*100) + '%');
}

function UploadFile(file, e, force) {
	var xhr = new XMLHttpRequest();
	xhr.upload.addEventListener('progress', progressHandler);
    xhr.addEventListener('load', loadHandler);
	var regex1 = RegExp('image/*');
	if (xhr.upload && regex1.test(file.type) && file.size <= 5000000) {
	// start upload
		xhr.open("POST", "{% url 'upload_image_addr' %}", true);
		//xhr.setRequestHeader("Content-Type", "multipart/form-data;");
		xhr.setRequestHeader("X_FILENAME", file.name);
		xhr.setRequestHeader("X-CSRFToken", csrf_token);
  		var fd = new FormData();
        fd.append('ima_file', file);
        fd.append('target', e.id);
        fd.append('force', force);
//  		fd.append("drive_file", file);
//  		fd.append("fileName", file.name);
  		xhr.send(fd);
//        xhr.send(file);
	}else{
	   console.log("bad file : This file size is" + (file.size <= 5000000) + " et type="+regex1.test(file.type));
	}
}