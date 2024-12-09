;string print from variable
print_msg macro string
    lea dx, string
    mov ah, 09h
    int 21h
endm

;take input from user
input MACRO
    mov ah, 01h
    int 21h
    
endm

;new line
new_line MACRO
    mov ah, 02h
    mov dl, 0dh
    int 12h
    
    mov dl, 0ah
    int 21h
endm

;print any character using resiser
print MACRO n
    mov dl, n
    mov ah, 02h
    int 21h 
endm

;calculate total fare and print it
calculator MACRO n
    mov bl,n
    print_msg passenger_number
    
    input
    sub al, 48
    
    mul bl
    aam 

    mov cx, ax
    add ch, 48
    add cl, 48
    
    print_msg total_fare_msg

    print ch
    print cl
    print '0' 
    print_msg bdt_msg
    print_msg line_msg2
endm
    
    

.model small
.stack 100h

.data
    
    ;General
    bdt_msg DB "/- BDT.$"
    
    ;Home/Main Menu Page
    wlc_line DB 13, 10,   " *****************************************************************$"
    wlc_msg DB 13, 10,    " **         Welcome to Metro Rail Ticket Fare Calculator        **$"
    intro_msg DB 13, 10, " **           Welcome to Shewrapara Metro Rail Station          **$"
    course_name DB 13, 10, " **           Microprocessor and Microcontrollers Project       **$"                                         
    developer_name DB 13, 10, " **           Develop by Md. Nazmul Hossain [223002089]         **$"                                         
                                             
    menu_msg DB 13, 10, 13, 10, "                 ***        MAIN MENU         ***$"
    menu_item1 DB 13, 10, "                 [1] North Bound.$"
    menu_item2 DB 13, 10, "                 [2] South Bound.$"
    exit_msg DB 13, 10, "                 [3] Exit.$"
    
    line_msg DB 13, 10, "                 --------------------------------$"
    menu_choose_msg DB 13, 10, "                 Which side do you want to go: $"
    
    line_msg2 DB 13, 10, " ---------------------------------$"
    
     
     
     
    
    
    ;North_Bound Page
    
    
    north_intro_msg DB 13, 10,          " **                   Welcome to North Side                     **$"
    north_bound_station_list DB 13, 10, " **                 North Bound Station List                    **$"                                         
    north_station_fare DB 13, 10,       " **               Northbound Station and Fare                   **$"
    
    ;station name print
        kazipara DB 13, 10, " [1] Kazipara        ------------------------------------   20 BDT$"
        mirpur10 DB 13, 10, " [2] Mirpur-10       ------------------------------------   20 BDT$"
        mirpur11 DB 13, 10, " [3] Mirpur 11       ------------------------------------   20 BDT$"
        pallabi DB 13, 10, " [4] Pallabi         ------------------------------------   30 BDT$"
        uttara_south DB 13, 10," [5] Uttara South    ------------------------------------   40 BDT$"
        uttara_center DB 13, 10," [6] Uttara Center   ------------------------------------   40 BDT$"
        uttara_north DB 13, 10," [7] Uttara North    ------------------------------------   50 BDT$"
    
    north_station_select DB 13, 10, " Which Station you wanna travel: $"
    passenger_number  DB 13, 10, " Enter Passengers Number: $"
    total_fare_msg DB 13, 10, " Total Fare: $"    
   
     
     