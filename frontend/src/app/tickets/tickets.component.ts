import { Component, ViewEncapsulation, OnInit , Input } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {TicketsService} from '../services/tickets.service'
import  {UserService} from '../services/user.service'
import {Ticket} from './ticket/ticket'
@Component({
    selector: 'app-tickets',
    templateUrl: './tickets.component.html',
    styleUrls: ['./tickets.component.scss'],
    encapsulation: ViewEncapsulation.None
})

export class TicketsComponent implements OnInit{
    tickets: Ticket[] = [];
    query: string;
    status: string='';
    page: number = 0;
    notice: string;
    constructor(private tickets_service: TicketsService ,private  route: ActivatedRoute,private user_service: UserService){
    }

    ngOnInit(){
        this.route
            .queryParams
            .subscribe(params => {
                this.notice = params['message'];
                this.load_tickets(this.page);
                setTimeout(() => {
                    this.notice = null;
                }, 4000);
            });
    }

    load_tickets(page: number) {
        this.tickets_service.get_tickets(page,this.query,this.status).then(res => {
            this.tickets = [];
            res.tickets.forEach(ticket => {
                this.tickets.push(new Ticket().load_from_json(ticket));
            })
        })
    }
    get current_user(){
        return this.user_service.current_user;
    }
    searchTickets(){
      this.load_tickets(this.page)
    }
    getPdf(){
        this.tickets_service.getPdf(this.query,this.status);
    }
}