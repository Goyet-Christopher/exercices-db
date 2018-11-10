
function displaySimilar(data) {
    var divList = $id("similarImages");
    var img = document.createElement('img');
    var inputID = document.createElement('input');
    //target in hidden input
    inputID = document.createElement('input');
    inputID.type="hidden";
    inputID.value=data.target;
    inputID.id="hidden_target_image";
    divList.appendChild(inputID);
    //add images thumbs
    for(i=0; i<data.closeIma.length; i++){
        div = document.createElement('div');
        div.setAttribute("class","file_container mrm mts");
        img = document.createElement('img');
        img.src = data.closeIma[i][1];
        img.setAttribute("class", "displayed");
        img.setAttribute("name", data.closeIma[i][2]);
        img.id="id_similarImage_"+i;
        img.setAttribute("onclick", "similarImagechoosen(this);");
        div.appendChild(img);
        inputID = document.createElement('input');
        inputID.setAttribute("type", "hidden");
        inputID.setAttribute("value", data.closeIma[i][0]);
        inputID.id="id_similarInput_"+i;
        div.appendChild(inputID);
        divList.appendChild(div);
    }
    //change class to show modal
    var element = $id("imageModal");   
    element.classList.add("modalDialogOpen");
}

function similarImagechoosen(e){
    thumb_url = e.src;
    filename = e.getAttribute("name"); 
    //console.log("thumb_url="+e.url);
    ima_target = $id("hidden_target_image").value;
    //console.log("ima_target="+ima_target);
    similar_id = (e.id).match(/\d+/g);
    //console.log("similar_id="+similar_id);
    ima_id = $id("id_similarInput_"+similar_id).value;
    var data = {is_valid : true, 
                id : ima_id,
                name : filename,
                url : thumb_url, 
                target : ima_target
               };
    $id("imageModal").setAttribute("class", "modalDialog");
    $id("similarImages").innerHTML="";
    placeThumb(data, false);
    message = $id("imageNameMessage");
    message.setAttribute("class", "");
}

function keepMyImage(e){
    id_target = $id("hidden_target_image").value;
    ima_target = $id(id_target);
    $id("imageModal").setAttribute("class", "modalDialog");
    $id("similarImages").innerHTML="";
    f = ima_target.files[0];
    //console.log("f=", f);
    UploadFile(f, ima_target, true);
}

function placeThumb(data, isnew){
    var target = $id(data.target);
    var img = document.createElement('img');
    img.src = data.url;
    img.setAttribute("class", "displayed");
    target.replaceWith(img);
    img.parentElement.setAttribute("data-state", "uploaded");
    var select = $id(data.target.replace(/-ima_file/g, "-ima_id").replace(/_upimage-/g, "_imageJoint-"));
    select.innerHTML = '<option value="'+data.id+'" selected>'+data.titre+'</option>';
    var num = data.target.match(/\d+/g);
    //console.log("num="+num);
    filename = $id("display-filename-"+num);
    filename.innerHTML = data.name;
    if (isnew == false){
        filename.setAttribute("class", "errorblock");
    }
}

function loadHandler(e) {
    //console.log(this.responseText);
    data = JSON.parse(this.responseText);
    if(this.status != 200){
      //console.log("XMLHttpRequest error ?")
      return;
    }
    //console.log("data:"+data);
    if (data.is_valid) {
        //console.log(data.target);
        placeThumb(data, true);
    }else{
        if (data.similars){
            displaySimilar(data);
        }else{
            console.log("non valid data");
        }
    }
}
