import { Injectable } from '@angular/core';
import { Angular2TokenService } from 'angular2-token';
import { Jsonp, URLSearchParams ,ResponseContentType} from '@angular/http';
import {Ticket}  from '../tickets/ticket/ticket';
import 'rxjs/add/operator/toPromise';
import 'rxjs/Rx';
import {BrowserXhr} from '@angular/http';
@Injectable()
export class TicketsService {
    constructor(private _tokenService: Angular2TokenService) { }

    get_tickets(page: number,query,status) {
        let params = new URLSearchParams();
        params.set('q',query);
        params.set('status',status);
        params.set('page',page.toString());
        return this._tokenService.get('tickets',{search: params}).map(res => res.json()).toPromise();
    }

    getTicket(id){
        return this._tokenService.get(`tickets/${id}`).map(res => res.json()).toPromise();
    }

    create(ticket: Ticket){
        return this._tokenService.post("tickets",{ticket: ticket});
    }

    post_comment(ticket: Ticket,comment_params){
        return this._tokenService.post("comments",{ticket_id: ticket.id,comment: comment_params}).map(res => res.json()).toPromise();
    }

    change_status(ticket: Ticket ,status: string){
        this._tokenService.put(`tickets/${ticket.id}/change_status`,{status: status}).subscribe(res => ticket.status_type = status)
    }

    getPdf(query,status){
        let params = new URLSearchParams();
        params.set('q',query);
        params.set('status',status);
        params.set('pdf','true');
        return this._tokenService.get('tickets',{search: params,
            responseType: ResponseContentType.Blob})
            .map(res => res.blob())
            .subscribe(
                data => {
                    var blob = new Blob([data], {type: 'application/pdf'});
                    window['saveAs'](blob, 'report.pdf');
                },
                err => console.error(err),
                () => console.log('done')
            );
    }


}
