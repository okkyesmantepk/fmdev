function btnHangUp(){
    $.post('https://np-phone/btnHangup', JSON.stringify({}))
} 

function btnAnswer(){ 
    $.post('https://np-phone/btnAnswer', JSON.stringify({}))
}

function pingReject(){
    $.post('https://np-phone/np-ui:pingReject', JSON.stringify({}))
} 

function pingAccept(){
    $.post('https://np-phone/np-ui:pingAccept', JSON.stringify({}))
}

function billDecline(){
}

function billAccept(data){
    let price = data.amount
    let sID = data.sellerID
    $.post('https://np-phone/purchaseCar', JSON.stringify({amount:price, sID: sID}))
}

function createCameraDropdown(cameraData) {
    var camData = `<li><a href="#" class="waves-effect waves-light" onclick="SetStateBagCamera('${cameraData.cid}')">${cameraData.name}</a></li>`
    console.log(camData)
    $('.removeCamera').append(camData);
}


function SetStateBagCamera(func) {
    $("#cameraRemoveID").val(func)
}