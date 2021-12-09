<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Benvinguts</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
        <link rel = "stylesheet" href ="{{('css/app.css')}}">

        <!-- Styles -->
        <style>
        </style>

        <style>
            body {
                font-family: 'Nunito', sans-serif;
            }
        </style>
    </head>
    <body class="antialiased">
        



        <div class=" block relative items-top justify-center min-h-screen bg-gray-100 dark:bg-gray-900 sm:items-center py-4 sm:pt-0">
            
        
            @if (Route::has('login'))
                <div class="hidden fixed top-0 right-0 px-6 py-4 sm:block">
                    @auth
                        <a href="{{ route('dashboard') }}" class="text-sm text-gray-700 underline">Dashboard</a>

                    @else
                    <button class="bg-green-400 hover:bg-green-200 text-gray-800 font-bold py-2 px-4 border border-gray-400 rounded shadow">
                        <a href="{{ route('login') }}" class="text-sm text-gray-700">Log in</a>
                    </button>
                    
                        @if (Route::has('register'))
                        <button class="bg-green-400 hover:bg-green-200 text-gray-800 font-bold py-2 px-4 border border-gray-400 rounded shadow">
                            <a href="{{ route('register') }}" class="text-sm text-gray-700">Register</a>
                        </button>                        
                        @endif
                    @endauth
                </div>
            @endif
            
            <h1 class = "font-extrabold text-3xl underline mb-2">Benvinguts a la nostre lliga</h1>

        </div>
    </body>
</html>

