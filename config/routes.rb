ActionController::Routing::Routes.draw do |map|
  
  map.resources :doctorshedulings
  map.resources :appointment_shedulings
  map.resources :opbillservices
  map.resources :floormasters
  map.resources :ipsearches

  map.resources :opsearches

  map.resources :op_enquiries

  map.resources :refundmasters
  map.resources :people

  map.resources :sessions
  
  map.resources :forms_lists

  map.resources :bedmasters

  map.resources :patientregistration_datas

   map.root :controller => 'sessions'
   map.resources :ipadvances
   
  map.resources :doctortransfers

   map.resources :ip_discharges
   
   map.resources :retain_beds
   
  map.resources :additional_bed_allocations

  map.resources :final_bill_cancel_services

  map.resources :final_bill_cancel_services

  map.resources :final_bill_cancels

  map.resources :final_services

  map.resources :final_bills

  map.resources :approximate_services

  map.resources :approximate_bills

  map.resources :pre_refunds

  map.resources :service_cancel_services

  map.resources :service_cancels

  map.resources :ip_services

  map.resources :ip_service_entries

  map.resources :ipadmissions

  map.resources :citymasters

  map.resources :patants

  map.resources :appointments

  map.resources :patents

  map.resources :physicians

  map.resources :doctors

  map.resources :states

  map.resources :countries

  map.resources :countrymasters

  map.resources :labresults
  map.resources :refundtables

  map.resources :postdiscounts

  map.resources :duespagemasters

  map.resources :usgtables

   
  map.resources :bloodtests

   map.resources :sonographytests

  map.resources :colonoscopytests

  map.resources :patient_fees

 

  

  map.resources :xray_values

  map.resources :xrays

  map.resources :urinetests

  map.resources :urinetests

  map.resources :stooltests

  map.resources :gastroscopytests

  map.resources :testresults

  map.resources :opbilling1s

  map.resources :testmasters

  map.resources :opbillings

  map.resources :loginmasters

  map.resources :consultationforms



  map.resources :insurenceinformations

  map.resources :patientappointmentinfos

  map.resources :contactinformations

  map.resources :patientinformations

  map.resources :patientregistrations

  map.resources :inpatientdailyreports

  map.resources :inpatiententries

  map.resources :patientappointmentregistrations

  map.resources :patientappointmentregistrations

  map.resources :patientappointmentregistrations

  map.resources :appointmentregistrations

  map.resources :doctorsschedulings

  map.resources :usermasters

  map.resources :usermasters

  map.resources :masters

  map.resources :masters

  map.resources :childmasters

  map.resources :masters

  map.resources :profilemasters

  map.resources :goodissuenotemasters

  map.resources :stockpointmasters

  map.resources :goodsrecieptnotemasters

  map.resources :purchaseordermasters

  map.resources :openingstockentrymasters

  map.resources :itemmasters

  map.resources :stackpointmasters

  map.resources :vendormasters

  map.resources :inventorylevel3masters

  map.resources :inventorylevel2masters

  map.resources :inventorylevel1masters

  map.resources :loanpaymentmasters

  map.resources :loandeductionmasters

  map.resources :leaveentrymasters

  map.resources :leaveentrymasters

  map.resources :leaveentrymasters

  map.resources :leaveentrymasters

  map.resources :leavemasters

  map.resources :loantypemasters

  map.resources :shiftmasters

  map.resources :holidaymasters

  map.resources :payroll_employeemasters

  map.resources :categorymasters

  map.resources :employeebankmasters

  map.resources :hospitalmasters

  map.resources :hospitalmasters

  map.resources :employeemasters

  map.resources :foodmasters

  map.resources :refferalmasters

  map.resources :parametersetupmasters

  map.resources :packagemasters

  map.resources :roommasters

  map.resources :wardmasters

  map.resources :usermasters

  map.resources :bankmasters

  map.resources :employeemasters

  map.resources :consultationcharges

  map.resources :consultationcharges

  map.resources :doctormasters

  map.resources :servicemasters

  map.resources :servicegroupmasters

  map.resources :doctors

  map.resources :doctors

  map.resources :doctors

  map.resources :departmentmasters

  map.resources :designationmasters

  map.resources :occupationmasters

  map.resources :citymasters

  map.resources :statemasters

  map.resources :countrymasters

  map.resources :currencymasters

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
