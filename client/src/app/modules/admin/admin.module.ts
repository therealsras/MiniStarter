import { RoleComponent } from './role/role.component';
import { TestErrorsComponent } from './test-errors/test-errors.component';
import { AboutComponent } from './about/about.component';
import { PieChartCardComponent } from './dashboard/pie-chart-card/pie-chart-card.component';
import { NumberCardComponent } from './dashboard/number-card/number-card.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from './dashboard/dashboard.component';
import { CoreModule } from 'src/app/core/core.module';
import { MaterialModule } from 'src/app/shared/material/material.module';
import { AdminRoutingModule } from './admin-routing.module';
import { TranslateModule } from '@ngx-translate/core';
import { UserComponent } from './user/user.component';
import { UserFormComponent } from './user/user-form/user-form.component';
import { UserRoleFormComponent } from './user/user-role-form/user-role-form.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { RoleFormComponent } from './role/role-form/role-form.component';
import { RolePermissionFormComponent } from './role/role-permission-form/role-permission-form.component';
import { SettingComponent } from './setting/setting.component';
import { AuditComponent } from './audit/audit.component';
import { AuditLogDetailsComponent } from './audit/audit-log-details/audit-log-details.component';
import { ProfileComponent } from './user/profile/profile.component';
import { GazetteerComponent } from './gazetteer/gazetteer.component';
import { DistrictComponent } from './gazetteer/district/district.component';
import { CommuneComponent } from './gazetteer/commune/commune.component';
import { VillageComponent } from './gazetteer/village/village.component';
import { ProvinceFormComponent } from './gazetteer/province-form/province-form.component';
import { DistrictFormComponent } from './gazetteer/district-form/district-form.component';
import { CommuneFormComponent } from './gazetteer/commune-form/commune-form.component';
import { VillageFormComponent } from './gazetteer/village-form/village-form.component';

@NgModule({
  declarations: [
    TestErrorsComponent,
    AboutComponent,
    DashboardComponent,
    NumberCardComponent,
    PieChartCardComponent,
    UserComponent,
    UserFormComponent,
    UserRoleFormComponent,
    ProfileComponent,
    RoleComponent,
    RoleFormComponent,
    RolePermissionFormComponent,
    SettingComponent,
    AuditComponent,
    AuditLogDetailsComponent,
    GazetteerComponent,
    DistrictComponent,
    CommuneComponent,
    VillageComponent,
    ProvinceFormComponent,
    DistrictFormComponent,
    CommuneFormComponent,
    VillageFormComponent
  ],
  imports: [
    CommonModule,
    AdminRoutingModule,
    MaterialModule,
    SharedModule,
    TranslateModule
  ]
})
export class AdminModule { }
