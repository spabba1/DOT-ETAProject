import StaffController from './staff.controller';
import AddStaffController from './addstaff.controller';
import MileageRateController from './mileagerate.controller';
import StaffFactory from './staff.factory';
import StaffEditController from './staffedit.controller';

export default angular.module('staff', [
])
    .controller('StaffController', StaffController)
    .controller('AddStaffController', AddStaffController)
    .controller('MileageRateController', MileageRateController)
    .controller('StaffEditController', StaffEditController)
    .factory('StaffFactory', StaffFactory);
