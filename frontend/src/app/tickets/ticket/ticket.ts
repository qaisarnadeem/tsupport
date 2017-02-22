import  {Comment} from './comment'
export  class Ticket{
    static status_mappings = {'in_progress': "In Progress", 'open': "Open" ,resolved: "Resolved"}
    comments: Comment[] = [];
    title: string = '';
    description: string = '';
    id: number;
    date: string = '';
    status_type: string = '';
    resolved_by_name: string = '';

    get status(){
        return Ticket.status_mappings[this.status_type] || this.status_type
    }

    is_new(): Boolean{
        return this.id == undefined || this.id == 0
    }

    commentable(){
        !this.is_new() && !this.resolved_status();
    }

    addComment(comment_json){
        this.comments.push(new Comment().load_from_json(comment_json));
    }

    load_from_json(json){
     this.title = json.title;
     this.description = json.description;
     this.id =  json.id;
     this.date = json.created_at;
     this.status_type = json.status;
     this.resolved_by_name = json.resolved_by && json.resolved_by.name;
     let comments = [];
        json.comments && json.comments.forEach(c => {
           this.comments.push(new Comment().load_from_json(c));
        });
     return this;
    }

    open_status(): Boolean{
        return this.status_type == 'open';
    }

    inprogress_status(): Boolean{
        return this.status_type == 'in_progress';
    }
    resolved_status(): Boolean{
        return this.status_type == 'resolved';
    }

}