import { NgModule } from '@angular/core'
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpModule } from '@angular/http';
import { RouterModule } from '@angular/router';

import { Angular2TokenService } from 'angular2-token';

import {
    OutputComponent,
    AuthComponent,
    RegisterComponent,
    SignInComponent,
    SignInOAuthComponent,
    SignOutComponent,
    ChangePasswordComponent,
    AccessResourceComponent,
    ValidateTokenComponent
} from './';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        RouterModule
    ],
    declarations: [
        AuthComponent,

        OutputComponent,

        RegisterComponent,
        SignInComponent,
        SignInOAuthComponent,
        ChangePasswordComponent,
        SignOutComponent,
        AccessResourceComponent,
        ValidateTokenComponent
    ],
    exports: [
        AuthComponent
    ]
})
export class AuthModule { }
