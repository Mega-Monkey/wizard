var wizardDogGreen = document.querySelector(".wizardDogGreen")
var wizardDogRed = document.querySelector(".wizardDogRed")
var wizardDogBlue = document.querySelector(".wizardDogBlue")
var avatar = document.querySelector(".avatar")

var clickWizardDogGreen = function(){
    avatar.value = "assets/dog_wizard_green.png"
}
var clickWizardDogRed = function(){
    avatar.value = "assets/dog_wizard_red.png"
}
var clickWizardDogBlue = function(){
    avatar.value = "assets/dog_wizard_blue.png"
}

wizardDogGreen.addEventListener("click", clickWizardDogGreen);
wizardDogRed.addEventListener("click", clickWizardDogRed);
wizardDogBlue.addEventListener("click", clickWizardDogBlue);
