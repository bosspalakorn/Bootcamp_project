## link >> https://replit.com/@BossPLK/Batch06ChatbotPizza?v=1 

# Homework 01 
# chatbot (rule-based)
# ordering pizza

# set menu in JOI restaurant 
# In JOI have pizza , appetizer and drink 

# JOI_pizza 

#PIZZA
pizza_id       <- c(1, 2, 3, 4, 5)
pizza_menu     <- c("Hawaiian", "Chicken BBQ", "Seafood","Ham and Bacon", "Peporone")
joipizza_menu  <- data.frame (pizza_id, pizza_menu)

#SIZE
pizza_sizeid   <- c(1, 2, 3)
pizza_size     <- c("S", "M", "L")
pizza_price    <- c(199, 350, 599)
joisizeprice   <- data.frame (pizza_sizeid,pizza_size, pizza_price )

#Appetizer
appetizer_id    <- c(1, 2, 3 ,4)
appetizer_menu  <- c("Cheese Sticks", "Calamari", "Chicken Pop ","Chicken Sticks" )
appetizer_price <- c(89,99,79,89)
appetizer_joi   <- data.frame (appetizer_id ,appetizer_menu,appetizer_price)

#Drink
drink_id      <- c(1, 2, 3, 4 ,5)
drink_menu    <- c(" Water","Sprite","Coke ","Beer","Greentea" )
drink_price   <- c(10, 20, 25 ,150, 25)
drink_joi     <- data.frame(drink_id, drink_menu, drink_price)

# Welcome customer
print ("Welcome to JOI restaurant ")
print("-----------------------------")

# question 01 
print ("Please enter your name before order pizza ")
user_name <- readLines("stdin", n=1)
print(paste("Hi", user_name))
print("-----------------------------")


orders  <-  c()
amounts <-  c()
order <- "None"
amount <- 0
order_con <- "1"
total_price1 <- 0
total_price2 <- 0
total_price3 <- 0
 

while (order_con == "1"){
# question 02  
print ("What do you want to order today ?")
print ("1.Pizza , 2. Appetizer , 3. Drink ")
  action <- readLines("stdin", n= 1)
  if ( !(action %in% c("1","2","3")) ){
    # in case customer type other number (incorrectly)
    print("Please select what menu would you like to order.")
    order_con <- "1"
}else if (action == 1){
    print (" You choose order pizza  ")
    print("-----------------------------")
    print (joipizza_menu)
    print("-----------------------------")
  
# question 03  
print (" Please select Topping (pizza_id)  ")
  pizza <- readLines("stdin", n=1)
    if (pizza == "1"){
    print("You choose Hawaiian.")
    order <- "Hawaiian Pizza"
    } else if (pizza == "2") {
    print("You choose Chicken BBQ.")
    order <- "Chicken BBQ Pizza"
    } else if (pizza == "3") {
    print("You choose Seafood .")
    order <- "Seafood Pizza"
    } else if (pizza == "4") {
    print("You choose Ham and Bacon .")
    order <- "Ham and Bacon Pizza"
    } else if (pizza == "5") {
    print("You choose Peporone .")
    order <- "Peporone Pizza"
    } else {
    print("Please Try run Again")
    }     
print("-----------------------------")  
print (joisizeprice)
print("-----------------------------")
  
# question 04  
print (" Please select Size (pizza_sizeid)")
  pizzasize <- readLines("stdin", n=1)
    if (pizzasize == "1"){
    print("You choose size S 199 Baht .")
    total_price1 <- total_price1 +  pizza_price[1] 
    } else if (pizzasize == "2") {
    print("You choose size M 350 Baht.")
    total_price1 <- total_price1 +  pizza_price[2]
    } else if (pizzasize == "3") {
    print("You choose size L 599 Baht.")
    total_price1 <- total_price1 +  pizza_price[3]
    }
  
# question 05 
    print("-----------------------------")  
    print(paste("How many", order, "do you want?"))
    amount <- readLines("stdin", n=1) 
    joitotal1 <- (total_price1 * as.numeric(amount))
    print(paste("Total price:", joitotal1))
    
# question 06    
 } else if (action == "2"){
    print("You choose order Appetizer ")
    print("-----------------------------")
    print(appetizer_joi)
    print("-----------------------------")
    print("Which Appetizer would you like to order?")
    appetizer <- readLines("stdin", n=1)
     if ( appetizer == "1"){
    print("You choose Cheese Sticks.")
    order <- "Cheese Sticks"
    total_price2 <- total_price2 +  appetizer_price[1] 
    } else if ( appetizer == "2") {
    print("You choose Calamari.")
    order <- "Calamari"
    total_price2 <- total_price2 +  appetizer_price[2] 
    } else if ( appetizer == "3") {
    print("You choose Chicken Pop .")
    order <- "Chicken Pop"
    total_price2 <- total_price2 +  appetizer_price[3] 
    } else if ( appetizer == "4") {
    print("You choose Chicken Sticks .")
    order <- "Chicken Sticks" 
    total_price2 <- total_price2 +  appetizer_price[4] 
     } else {
    print("Please Try run Again")
     } 
  
# question 07 
    print("-----------------------------")  
    print(paste("How many", order, "do you want?"))
    amount <- readLines("stdin", n=1) 
    joitotal2 <- (total_price2 * as.numeric(amount))
    print(paste("Total price:", joitotal2))
    
# question 08   
  }else if (action == "3"){
    print("You choose Drink ")
    print("-----------------------------")
    print(drink_joi)
    print("-----------------------------")
    print("Which Drink would you like to order?")
    drink <- readLines("stdin", n=1)
     if ( drink == "1"){
    print("You choose Water.")
    order <- " Water"
    total_price3 <- total_price3 +  drink_price[1] 
    } else if ( drink == "2") {
    print("You choose Sprite.")
    order <- "Sprite "
    total_price3 <- total_price3 +  drink_price[2]
    } else if ( drink == "3") {
    print("You choose Coke.")
    order <- "Coke"
    total_price3 <- total_price3 +  drink_price[3]
    } else if ( drink == "4") {
    print("You choose Beer .")
    order <- "Beer" 
    total_price3 <- total_price3 +  drink_price[4]
    } else if ( drink == "5") {
    print("You choose Greentea .")
    order <- "Greentea" 
    total_price3 <- total_price3 +  drink_price[5]
    } else {
    print("Please Try run Again")
    } 
    
# question 09 
    print("-----------------------------")  
    print(paste("How many", order, "do you want?"))
    amount <- readLines("stdin", n=1)
    joitotal3 <- (total_price3 * as.numeric(amount))
    print(paste("Total price:", joitotal3))
  } 
# question 10 
  print("Do you want to order anything else ?")
  print("1.Yes,  0.No") 
  order_con <- readLines("stdin", n = 1) 
  
# collect order and amount in vector
  orders  <- c(orders, order)
  amounts <- c(amounts, amount)
}

  count_membercard <- 0
  while (count_membercard >= 0) {
  count_membercard + 1

# question 11    
  print("Do you have JOI member card? (Y/N)")
  member <- readLines("stdin", n=1)

  # if customer  have JOI member card
  if (member == "Y") {
    print("Please enter your JOI member card number.")
    member_num <- as.numeric(readLines("stdin", n=1))
    print( paste("Welcome back",user_name) )
    break
    
  # if not have JOI member card
  } else if (member == "N") {
      count_regis <- 0
      while (count_regis >= 0) {
      count_regis + 1
      print("Do you want to register membership? (Y/N)")
      regis_mem <- readLines("stdin", n=1)
  # if customer want to register
      if (regis_mem == "Y") {
        print("Please enter your Firstname")
        regis_firstname <- readLines("stdin", n=1)
        print("Please enter your Lastname")
        regis_lastname <- readLines("stdin", n=1)
        print("Please enter your Email")
        regis_email <- readLines("stdin", n=1)
        print("Please enter your DOB (YYYY-MM-DD)")
        regis_dob <- readLines("stdin", n=1)
        print("Successfully Registered!")
        print( paste("Welcome", regis_firstname) )
        member_num <- sample.int(1000000:9999999, 1)
        print( paste("Your member number is:", member_num) )
        break
          
      # if dont want to register
      } else if (regis_mem == "N") {
        member_num <- 0
        break
        
      } else {
        print("Wrong input, Please select again (Y/N)")
      }
    }
break
      
  } else {
    print("Wrong input, Please select again (Y/N)")
  }
  }

# create order dataframe
all_order <- data.frame("order" = orders, "amount" = amounts)

# question 12  
if (all_order[1,"order"] != "None"){
    payment_check <- "0"
  while (payment_check == "0"){
    print("Please select payment method")
    print("1.Cash, 2.Promptpay , 3.Credit Card ")
    payment <- readLines("stdin", n = 1)
      if (payment == "1"){
      joi_payment <- "Cash "
      break
      } else if (payment == "2"){
      joi_payment <- "Promptpay"
      break
      } else if (payment == "3"){
      joi_payment <- "Credit Card"
      break
      }
    }
  
  all_joitotal <- ((total_price1 * as.numeric(amount))+(total_price2 * as.numeric(amount))+(total_price3 * as.numeric(amount)))
 
  
  print("-----------------------------")
  print("This is your total order.")
  print(all_order)
  print(paste("Total price:",all_joitotal,"$"))
  print(paste("Payment method:", joi_payment))
  print("-----------------------------")
  print("Thank you for your order.")
  print(" Make a customer, not a sale.  ")
  print(" # JOI pizza 1133 ")
  print("-----------------------------")
}

# question 13
print("Please rate: 1-5, 1 is very bad, 5 is very good:")
        CRM_joirate <- readLines("stdin", n=1)
#check score if < 3  required comment from customer
      if (CRM_joirate < 3) {
        print("Please Enter your comment:")
        comment_chatbot <-  readLines("stdin", n=1)
        print("Your comment is received, Thanks")
        break
        }
