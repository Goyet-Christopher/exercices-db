{% load myfilters %}

function show_hide_corr(e, id){
    var input=document.getElementById(id);
    if(e.checked){ 
        input.style = 'display'; 
        input.focus();
    }else{
        input.style = 'display:None';
    }
}

function radio_onclick(num){
    var id_on = "div-activaitor-"+num;
    var e=document.getElementById(id_on);
    e.style = 'display';
    e.focus();
    for(i=0;i<2;i++){
        if (i != num){
            id_off = "div-activaitor-"+i;
            e=document.getElementById(id_off);
            e.style = 'display:None';
        }
    }
    {% if eno_form.eno_cor.initial|is_empty %}
    e=document.getElementById('id_correction-cor_latex');
    if (num==0){
        e.disabled=false;
    }
    if (num==1){
        e.disabled=true;
    }
    {% endif %}
}

function updateTotalForms(formPrefix){
    console.log('formsetZone_'+formPrefix);
    var fzone = document.getElementById('formsetZone_'+formPrefix);
    var num = fzone.childElementCount;
    document.getElementById('id_'+formPrefix+'-TOTAL_FORMS').value = num;
    return num;
}

function add_sorte(formPrefix){
    //Copy eform
    var eform = document.getElementById('eform_'+formPrefix);
    var eformCopy = eform.cloneNode(true);
    eformCopy.removeAttribute("id");
    //Update prefix to formset index
    var fzone = document.getElementById('formsetZone_'+formPrefix);
    eformCopy.innerHTML = eformCopy.innerHTML.replace(/__prefix__/g, fzone.childElementCount);
    fzone.appendChild(eformCopy); 
    return updateTotalForms(formPrefix);
}

function del_sorte(e, i, formPrefix){
    var fzone = document.getElementById('formsetZone_'+formPrefix);
    if (fzone.children.length<=0) {return}
    var eform = e.closest("div.nsorte");
    var delcheck = $id("id_"+formPrefix+"-"+i+"-DELETE");
    delcheck.checked = true;
    //Update next prefixes to formset index
//     for (var cpt=i+1;cpt<fzone.children.length;cpt++){
//         for(var j=0;j<fzone.children[cpt].children.length;j++){
//             try{
//                 child = fzone.children[cpt].children[j];
//                 for(var k=0;k<child.attributes.length;k++){
//                     child.attributes[k].value=child.attributes[k].value.replace(new RegExp(cpt, "g"), cpt-1);
//                 }
//             }catch{}
//         }
//     }
//    eform.remove();
    eform.setAttribute("class", "hidden");
//    updateTotalForms(formPrefix);
}