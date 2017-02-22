import { Component, OnInit } from '@angular/core';
import { Angular2TokenService } from 'angular2-token';
import {ActivatedRoute, Router} from "@angular/router";

@Component({
    selector: 'sign-out',
    templateUrl: 'sign-out.component.html'
})
export class SignOutComponent implements OnInit{

    constructor(private _tokenService: Angular2TokenService,private route: ActivatedRoute , private router: Router) {
    }

    onSubmit() {
        this.sign_out();
    }

    ngOnInit(){
        this.route.queryParams.
        subscribe(params => {
            if (params['force'] == 'true') {
                this.sign_out();
            }
        });
    }

    private sign_out() {
        this._tokenService.signOut().subscribe(
        );
        this.router.navigate(['/session/sign-in']);
    }
}
