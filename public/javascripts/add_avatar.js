var wizardDogGreen = document.querySelector(".wizardDogGreen")
var wizardDogRed = document.querySelector(".wizardDogRed")
var wizardDogBlue = document.querySelector(".wizardDogBlue")
var avatar = document.querySelector(".avatar")
var avatar_button_green = document.querySelector(".avatar_button_green")
var avatar_button_blue = document.querySelector(".avatar_button_blue")
var avatar_button_red = document.querySelector(".avatar_button_red")

var clickWizardDogGreen = function(){
    avatar.value = "assets/dog_wizard_green.png"
    avatar_button_green.classList.add('clicked')
    avatar_button_red.classList.remove('clicked')
    avatar_button_blue.classList.remove('clicked')
}
var clickWizardDogRed = function(){
    avatar.value = "assets/dog_wizard_red.png"
    avatar_button_red.classList.add('clicked')
    avatar_button_green.classList.remove('clicked')
    avatar_button_blue.classList.remove('clicked')
}
var clickWizardDogBlue = function(){
    avatar.value = "assets/dog_wizard_blue.png"
    avatar_button_blue.classList.add('clicked')
    avatar_button_green.classList.remove('clicked')
    avatar_button_red.classList.remove('clicked')
}

wizardDogGreen.addEventListener("click", clickWizardDogGreen);
wizardDogRed.addEventListener("click", clickWizardDogRed);
wizardDogBlue.addEventListener("click", clickWizardDogBlue);
