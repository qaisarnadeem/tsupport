import { NgModule } from '@angular/core'
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import {TicketsComponent} from './tickets.component'
import {TicketsService} from "../services/tickets.service";
import { TruncatePipe } from 'angular2-truncate';
import {
    TicketComponent
} from './';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        RouterModule
    ],
    providers: [TicketsService]
    ,
    declarations: [
        TicketComponent , TicketsComponent,TruncatePipe
    ],
    exports: [
        TicketComponent ,TicketsComponent
    ]
})
export class TicketsModule { }
