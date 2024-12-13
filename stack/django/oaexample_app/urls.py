####OBJECT-ACTIONS-URL-IMPORTS-STARTS####
from rest_framework.routers import DefaultRouter
from django.urls import include, path
from .views import UserModelListView
from .views import UserStatsView
from .views import RenderFrontendIndex
from .views import redirect_to_frontend
from .views import migrate, collectstatic
from .views import UsersViewSet
from .views import OfficialsViewSet
from .views import CitiesViewSet
from .views import RalliesViewSet
from .views import PublicationViewSet
from .views import ActionPlanViewSet
from .views import MeetingsViewSet
from .views import ResourcesViewSet
from .views import PageViewSet
from .views import InvitesViewSet
from .views import SubscriptionsViewSet
from .views import RoomsViewSet
from .views import AttendeesViewSet
from .views import TopicsViewSet
from .views import ResourceTypesViewSet
from .views import MeetingTypesViewSet
from .views import StatesViewSet
from .views import PartiesViewSet
from .views import StakeholdersViewSet
####OBJECT-ACTIONS-URL-IMPORTS-ENDS####
urlpatterns = [path('', RenderFrontendIndex.as_view(), name='index')]

####OBJECT-ACTIONS-URLS-STARTS####
OARouter = DefaultRouter(trailing_slash=False)
OARouter.register('users', UsersViewSet, basename='users')
OARouter.register('officials', OfficialsViewSet, basename='officials')
OARouter.register('cities', CitiesViewSet, basename='cities')
OARouter.register('rallies', RalliesViewSet, basename='rallies')
OARouter.register('publication', PublicationViewSet, basename='publication')
OARouter.register('action_plan', ActionPlanViewSet, basename='action_plan')
OARouter.register('meetings', MeetingsViewSet, basename='meetings')
OARouter.register('resources', ResourcesViewSet, basename='resources')
OARouter.register('page', PageViewSet, basename='page')
OARouter.register('invites', InvitesViewSet, basename='invites')
OARouter.register('subscriptions', SubscriptionsViewSet, basename='subscriptions')
OARouter.register('rooms', RoomsViewSet, basename='rooms')
OARouter.register('attendees', AttendeesViewSet, basename='attendees')
OARouter.register('topics', TopicsViewSet, basename='topics')
OARouter.register('resource_types', ResourceTypesViewSet, basename='resource_types')
OARouter.register('meeting_types', MeetingTypesViewSet, basename='meeting_types')
OARouter.register('states', StatesViewSet, basename='states')
OARouter.register('parties', PartiesViewSet, basename='parties')
OARouter.register('stakeholders', StakeholdersViewSet, basename='stakeholders')

if urlpatterns is None:
    urlpatterns = []
    
urlpatterns += [
    path('account/provider/callback/', redirect_to_frontend, name='provider_callback_no_provider'),
        
    path('api/users/<int:user_id>/<str:model_name>/', UserModelListView.as_view(), name='user-model-list'),
    path('api/users/<int:user_id>/<str:model_name>/stats/', UserStatsView.as_view(), name='user-model-stats'),

    path('migrate/', migrate, name='migrate'),
    path('collectstatic/', collectstatic, name='collectstatic'),
    path('api/', include(OARouter.urls)),
]
####OBJECT-ACTIONS-URLS-ENDS####


from .views import SendCodeView, VerifyCodeView
urlpatterns += [
    path('objectactions/auth/sms', SendCodeView.as_view(), name='send_code'),
    path('objectactions/auth/verify-sms', VerifyCodeView.as_view(), name='verify_code'),
]
































































