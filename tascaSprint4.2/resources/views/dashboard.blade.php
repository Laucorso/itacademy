<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>
   <div class= "card-body">
       @if(session('status'))
            <div class= "alert alert-success" role="alert">
                {{session('status')}}
            </div>
        @endif
            {{__('You are logged in')}}
</x-app-layout>
