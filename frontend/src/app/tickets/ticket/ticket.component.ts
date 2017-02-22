import { Component, ViewEncapsulation, OnInit , Input } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import  {UserService} from '../../services/user.service'
import 'rxjs/add/operator/switchMap';
import {TicketsService} from '../../services/tickets.service'
import {Ticket} from './ticket'
@Component({
    selector: 'app-tickets',
    templateUrl: './ticket.component.html',
    styleUrls: ['./ticket.component.scss'],
    encapsulation: ViewEncapsulation.None
})

export class TicketComponent implements  OnInit{
    ticket: Ticket;
    comment_text = "";
    constructor(private tickets_service: TicketsService , private route: ActivatedRoute ,private router: Router,private user_service: UserService){

    }
    ngOnInit(){
        this.route.params.
            subscribe(params => {
                if(params['id']){
                    this.tickets_service.getTicket(+params['id']).then(ticket => this.ticket = new Ticket().load_from_json(ticket))
                }else {
                 this.ticket = new Ticket();
                 console.log(this.ticket);
                }
            });
    }

    onSubmit(){
     this.tickets_service.create(this.ticket);
     this.router.navigate(["/tickets"],{queryParams: {message: "Your ticket has successfully been placed. We will get back to you very soon"}})
    }

    get current_user(){
        return this.user_service.current_user;
    }
    change_status(status){
        this.tickets_service.change_status(this.ticket,status);
    }

    postComment(){
     this.tickets_service.post_comment(this.ticket,{description: this.comment_text}).then(comment => {
         this.ticket.addComment(comment);
         this.comment_text = '';
     });
    }
    myComment(comment){
        return comment.user.id == this.current_user.id;
    }
}