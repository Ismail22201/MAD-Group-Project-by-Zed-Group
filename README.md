# Group Project by Zed Group

Group Members:
  1. Rayyanur Rahman 1929067
  2. Muhammad Ismail 1922235
  
Summary:
  Our project is about a Task Management app that allows the user to manage their tasks. It utilizes Flutter, Dart and GetX library for the frontend, and GoLang & REST API for the backend. Our app allows the user to create tasks, view tasks, edit tasks and delete tasks. These tasks are stored on a server and interacted with using a REST API.

Objective:
  The main objectives of our project are:
  1. To allow the user to create, view, edit and delete tasks.
  2. To store these tasks in a server or database and retrieve them when needed by the user.
  
Installation Instructions:
  1.	Download and install Go: https://golang.org/dl/
  2.	Set GOPATH environment variable: https://github.com/golang/go/wiki/SettingGOPATH
  3.	Download and install Visual Studio Code: https://code.visualstudio.com/download
  4.	Install the Go extension in Visual Studio Code: https://marketplace.visualstudio.com/items?itemName=golang.Go
  5.	Restart Visual Studio Code.
  6.	Verify Go installation by running "go version" in the Integrated Terminal.
  7.  Place our "go" folder in the GOPATH.
  8.  Open main.go in Visual Studio and open the terminal.
  9.  Then enter in the terminal: $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
  10. Then: cd src
  11. Then: go run main.go
  12. Now the server should be running.
  13. Finally run our main.dart file in the lib folder. "we got the data" should appear in the debug console.

Project Details:
  1. Homepage: 
     This is the first page of our app. It includes 2 buttons, "Add Task" and "View All". If the "Add Task" button is tapped, then the user will be taken to the Add Task page. And if they tap the "View All", it will lead them to the View Tasks page.
    
     ![Homepage](https://user-images.githubusercontent.com/88615039/215794258-85ab715a-454c-46ab-a527-de3854cc3b44.jpg)
    
  2. Add Task: 
     In this page the user may enter the name of their task and its details, and click the "Add" button to save it.
  
     ![Add Task](https://user-images.githubusercontent.com/88615039/215799451-f1f42f80-7988-4a57-af3a-c4086cef5032.jpg)
     
     If the user does not write a title, the following message will appear:
     
     ![Validation 1](https://user-images.githubusercontent.com/88615039/215800698-008b872f-28c5-42c8-ab52-a695a092d663.jpg)
     
     If the title is less than 10 characters, this message will appear:
     
     ![Validation 2](https://user-images.githubusercontent.com/88615039/215800751-e8e36c43-77ce-41ad-a0d0-525c034b2c28.jpg)

     And finally if the task details is less than 20 characters, this will appear:
     
     ![Validation 3](https://user-images.githubusercontent.com/88615039/215800798-65497da2-35c0-43bf-8f59-9d2c9f79a902.jpg)
     
  3. View and Edit Tasks: 
     In this page the user may view all the tasks they have saved:
     
     ![View All Tasks](https://user-images.githubusercontent.com/88615039/215801702-85bcea8b-4dd3-4b8b-a238-37a918ec9208.jpg)

     If the user swipes it to the right, then a menu will appear that will allow them to view the details of the task by tapping the "View" button, and to edit the task by tapping the "Edit" button.
     
     ![View or Edit Tasks](https://user-images.githubusercontent.com/88615039/215803686-05c11107-98cc-42e9-b58f-2c92d88722c0.jpg)

  4. Delete Task: 
     If the user swipes the task to the left, then it will be deleted:
     
     ![Swipe Left](https://user-images.githubusercontent.com/88615039/215801965-374a392f-a64f-4de8-b430-521a1e1aff6c.jpg)
  
