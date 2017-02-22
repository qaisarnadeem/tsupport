import { Component, ViewEncapsulation, OnInit } from '@angular/core';
import { Angular2TokenService } from 'angular2-token';
import  {UserService} from './services/user.service'

@Component({
    selector: 'app',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.scss'],
    encapsulation: ViewEncapsulation.None
})
export class AppComponent {
    today = new Date();
    constructor(private _tokenService: Angular2TokenService,private user_service: UserService) {
        // this._tokenService.init({signInRedirect: '/session/sign-in',
        //     signInStoredUrlStorageKey: 'redirectTo'
        // });
    }
    current_user(){
        return this._tokenService.userSignedIn()
    }
    user(){
        return this.user_service.current_user
    }


}
