import { RouterModule, Routes } from '@angular/router';
import {SignInComponent,RegisterComponent , ChangePasswordComponent} from './auth'
import {NotFoundComponent ,Error500Component} from './shared'
import {TicketsComponent} from  './tickets'
import {TicketComponent} from  './tickets'
import {
    AuthComponent,SignOutComponent,RestrictedComponent
} from './';

import { UserService } from './services/user.service';

const routerConfig: Routes = [
    { path: '', component: AuthComponent},
    {
            path: 'sign-in',component: SignInComponent
    },
    {
        path: 'auth/sign_out' , component: SignOutComponent
    },
    {
        path: 'tickets' ,component: TicketsComponent ,canActivate: [UserService]
    }, {path: "tickets/new" , component: TicketComponent, canActivate: [UserService]}, {path: 'tickets/:id',component: TicketComponent, canActivate: [UserService]}
    ,
    {path: 'session',children: [{
    path: 'change-password',component: ChangePasswordComponent}
    ]
    },
    { path: 'restricted', component: RestrictedComponent, canActivate: [UserService] },
    { path: '404', component: NotFoundComponent },
    { path: '500', component: Error500Component },
    { path: '504', component: Error500Component },
    { path: '**', component: NotFoundComponent }
];

export const routes = RouterModule.forRoot(routerConfig, { useHash: true });
