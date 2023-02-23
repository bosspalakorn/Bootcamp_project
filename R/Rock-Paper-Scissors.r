#link >>https://replit.com/@BossPLK/Batch06Chatbot-Pao-Ying-Chub?v=1

# Home work 02
# Pao Ying Chub
#users play unlimited times 

#object 
win <- 0
tie <- 0
loss <- 0


# Pao Ying Chub
print(" JOI rock paper scissors game ")
print("Welcome Krub, Let's play Pao Ying Chub !")
print ("Please enter your name  ")
user_name <- readLines("stdin", n=1)
print(paste("Hi", user_name))
print("-----------------------------")

play <- ""  
while( !(play %in% c("0", "1")) ){
    print("Are you ready? 1.Yes  0.No")
    play <- readLines('stdin', n = 1) 
  }
if (play == "0"){
  print("See you later!")
} else if (play == "1")
         
print("Select your number weapon (1  rock, 2  paper, 3  scissors) or 0 for exit:")
player_result <- as.numeric(readLines("stdin", n=1))
while(player_result!= 0){
  joi_bot <- sample(1:3, 1)
  
  # rock
  if(player_result == 1){
    if(joi_bot == 1){
      print(" YOU    : rock ")
      print(" JOI    : rock ")
      print("-----------------------------------------------------------")
      print(" Result : Tie  ")
      print("-----------------------------------------------------------")
      
      tie <- tie+1
      
    } else if(joi_bot == 2){
      print(" YOU    : rock ")
      print(" JOI    : paper ")
      print("-----------------------------------------------------------")
      print(" Result : Loss  ")
      print("-----------------------------------------------------------")
  
      loss <- loss+1
      
    } else {
      print(" YOU    : rock ")
      print(" JOI    : scissors ")
      print("-----------------------------------------------------------")
      print(" Result : Win  ")
      print("-----------------------------------------------------------")
  
      win <- win+1
    }
  # paper
  } else if (player_result == 2){
    if(joi_bot == 1){
      print(" YOU    : paper ")
      print(" JOI    : rock  ")
      print("-----------------------------------------------------------")
      print(" Result : Win  ")
      print("-----------------------------------------------------------")
      
      win <- win+1

    } else if(joi_bot == 2){
      print(" YOU    : paper ")
      print(" JOI    : paper  ")
      print("-----------------------------------------------------------")
      print(" Result : Tie   ")
      print("-----------------------------------------------------------")
      
      tie <- tie+1
    } else {
      print(" YOU    : paper ")
      print(" JOI    : scissors  ")
      print("-----------------------------------------------------------")
      print(" Result : Loss  ")
      print("-----------------------------------------------------------")
      
      loss <- loss+1
    }
  # scissors
  } else if (player_result== 3){
    if(joi_bot== 1){
      print(" YOU    : scissors ")
      print(" JOI    : rock  ")
      print("-----------------------------------------------------------")
      print(" Result : Loss  ")
      print("-----------------------------------------------------------")
      
      loss <- loss+1
      
    } else if(joi_bot == 2){
      print(" YOU    : scissors ")
      print(" JOI    : paper  ")
      print("-----------------------------------------------------------")
      print(" Result : Win  ")
      print("-----------------------------------------------------------")
      
      win <- win+1
    } else {
      print(" YOU    : scissors ")
      print(" JOI    : scissors  ")
      print("-----------------------------------------------------------")
      print(" Result : Tie  ")
      print("-----------------------------------------------------------")
      
      tie <- tie+1
    }
  } else {
    print("Try again")
  }
  print("Your turn select your number weapon (1  rock, 2  paper, 3  scissors) or 0 for exit:")
  player_result <- as.numeric(readLines("stdin", n=1))
}


print("--------------------------------------------------------------")
print(" TOTAL SUMMARY ")
print(paste(user_name ,"result summary"))
print(paste("Win", win, "time(s)"))
print(paste("Tie", tie, "time(s)"))
print(paste("Loss", loss, "time(s)"))
print(" Thank you for playing my game.  ")
print(" JOI BOT Pao Ying Chub ! :-: ")
print("--------------------------------------------------------------")



