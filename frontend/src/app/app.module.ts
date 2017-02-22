import { NgModule } from '@angular/core'
import { Http } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';
import { HttpModule } from '@angular/http';
import  {SharedModule} from './shared/shared.module'
import  {UserService} from './services/user.service'
import { Angular2TokenService, A2tUiModule } from 'angular2-token';
import  {TicketsModule} from './tickets'
import {HttpService} from './services/http.service'
import {
    AppComponent,
    AuthModule,
    RestrictedModule,
    routes
} from './';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
@NgModule({
    imports: [
        routes,
        BrowserModule,
        HttpModule,
        AuthModule,
        RestrictedModule,TicketsModule,
        A2tUiModule,SharedModule,NgbModule.forRoot()
    ],
    providers: [
        Angular2TokenService , UserService, { provide: Http, useClass: HttpService }
    ],
    declarations: [ AppComponent],
    bootstrap: [ AppComponent ]
})
export class AppModule { }
