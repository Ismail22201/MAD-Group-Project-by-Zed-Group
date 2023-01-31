package main
import (
	"fmt"
	"log"
	"net/http"
	"encoding/json"
	"strconv"
	"math/rand"
	"time"
	"github.com/gorilla/mux"
)

type Tasks struct {
	ID         string `json:"id"`
	TaskName   string `json:"task_name"`
	TaskDetail string `json:"task_detail"`
	Date       string `json:"date"`
}

var tasks []Tasks

func updateTask(w http.ResponseWriter, r *http.Request){
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	flag := false
	for index, item := range tasks {
		if item.ID == params["id"] {
			tasks = append(tasks[:index], tasks[index+1:]...)
			var task Tasks
			_ = json.NewDecoder(r.Body).Decode(&task)
			task.ID = params["id"]
			currentTime := time.Now().Format("01-02-2006")
			task.Date = currentTime
			tasks = append(tasks, task)
			flag = true
			json.NewEncoder(w).Encode(task)
			return
		}
	}
	if flag == false {
		json.NewEncoder(w).Encode(map[string]string{"status":"Error"})
	}
}

func deleteTask(w http.ResponseWriter, r *http.Request){
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	flag := false
	for index, item := range tasks {
		if item.ID == params["id"] {
			tasks = append(tasks[:index], tasks[index+1:]...)
			flag = true
			json.NewEncoder(w).Encode(map[string]string{"status":"Success"})
			return
		}
	}
	if flag == false {
		json.NewEncoder(w).Encode(map[string]string{"status":"Error"})
	}
}

func createTask(w http.ResponseWriter, r *http.Request){
	w.Header().Set("Content-Type", "application/json")
	var task Tasks
	_ = json.NewDecoder(r.Body).Decode(&task)
	task.ID = strconv.Itoa(rand.Intn(1000))
	currentTime := time.Now().Format("01-02-2006")
	task.Date = currentTime
	tasks = append(tasks, task)
	json.NewEncoder(w).Encode(task)
}

func getTask(w http.ResponseWriter, r *http.Request){
	w.Header().Set("Content-Type", "application/json")
	taskId := mux.Vars(r)
	flag := false
	for i:=0;i<len(tasks);i++{
		if taskId["id"] == tasks[i].ID{
			json.NewEncoder(w).Encode(tasks[i])
			flag = true
			break
		}
	}
	if flag == false {
		json.NewEncoder(w).Encode(map[string]string{"status":"Error"})
	}
}
func getTasks(w http.ResponseWriter, r *http.Request){
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
}
func homePage(w http.ResponseWriter, r *http.Request){
	json.NewEncoder(w).Encode("Home Page")
}

func handleRoute(){
	route :=mux.NewRouter()
	route.HandleFunc("/", homePage).Methods("GET")
	route.HandleFunc("/gettasks", getTasks).Methods("GET")
	route.HandleFunc("/gettask/", getTask).Queries("id", "{id}").Methods("GET")
	route.HandleFunc("/create", createTask).Methods("POST")
	route.HandleFunc("/delete/", deleteTask).Queries("id", "{id}").Methods("DELETE")
	route.HandleFunc("/update/", updateTask).Queries("id", "{id}").Methods("PUT")


	log.Fatal(http.ListenAndServe(":8082", route))
}

func allTasks(){
	task := Tasks{
		ID: "1",
		TaskName: "Task 1",
		TaskDetail: "Details of Task 1",
		Date: "2023-01-22"}
	task1 := Tasks{
		ID: "2",
		TaskName: "Note 2",
		TaskDetail: "Details of Task 2",
		Date: "2023-01-27"}
	
	tasks = append(tasks, task)
	tasks = append(tasks, task1)
	fmt.Println("Got all the task")
}

func main(){
	allTasks()
	handleRoute()
	fmt.Println("Hello there")
	
}