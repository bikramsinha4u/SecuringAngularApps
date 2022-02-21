import { NgModule } from '@angular/core';
import { AccountService } from './account.service';
import { ProjectService } from './project.service';

@NgModule({
    imports: [],
    exports: [],
    declarations: [],
    providers: [
    AccountService,
    ProjectService
    ],
})
export class CoreModule { }
