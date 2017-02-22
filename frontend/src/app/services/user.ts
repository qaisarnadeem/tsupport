export  class User {
    email: string;
    id: number;
    role: string;
    load_from_json(json): User{
        if(!json){
            return this;
        }
        this.email = json.email;
        this.id = json.id;
        this.role = json.role;
        return this;
    }
    is_admin?(): Boolean{
        return this.role == 'admin';
    }
    is_agent?(): Boolean{
        return this.role == 'agent';
    }
    is_customer?(): Boolean{
        return this.role == 'customer';
    }
}