import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router'
import { Angular2TokenService, SignInData } from 'angular2-token';

@Component({
    selector: 'sign-in',
    templateUrl: 'sign-in.component.html'
})
export class SignInComponent {

    private _signInData: SignInData = <SignInData>{};
    private _output: any;

    constructor(private _tokenService: Angular2TokenService ,private  router: Router) { }

    // Submit Data to Backend
    onSubmit() {

        this._output = null;

        this._tokenService.signIn(this._signInData).subscribe(
            res => {
                this._signInData    = <SignInData>{};
                this._output        = res;
                this.router.navigateByUrl(localStorage.getItem('redirectTo') || '/');
            }, error => {
                this._signInData    = <SignInData>{};
                this._output        = error;
            }
        );
    }
}
