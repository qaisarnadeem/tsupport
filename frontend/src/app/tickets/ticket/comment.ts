export  class Comment{
    description: string = '';
    user: Object;
    date: string;
    load_from_json(json){
        this.description = json.description;
        this.date = json.created_at;
        this.user = json.user;
        return this;
    }
}