import { Component } from '@angular/core';
import  {Router} from '@angular/router'
import { Angular2TokenService } from 'angular2-token';
import {UserService} from "../../services/user.service";
@Component({
    selector: 'top-nav',
    templateUrl: './topnav.html',
    styleUrls: ['./topnav.scss']
})

export class TopNavComponent {
    constructor(public _tokenService: Angular2TokenService ,private  router: Router ,private user_service: UserService){

    }
	toggle = false;
    signOut(){
        this._tokenService.signOut();
        this.toggle = false;
        this.router.navigate(["/"]);
    }
}
