@extends('layouts.dashboard')
@section('content')

<a href = "jugadors/create">
    <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 border border-green-800 rounded">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><path d="M21 2H3a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h7v2H8v2h8v-2h-2v-2h7a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zm0 7h-7v2h7v5H3v-5h5v3l4-4l-4-4v3H3V4h18z" fill="currentColor"/></svg>
        <span>Registrar nou jugador</span>
    </button>
</a>
    <table class = "table w-full mt-6">
        <thead>
            <tr class = "font-sans md:text-xl lg:text-3xl">
                <th class ="border border-gray-400 px-4 py-2">ID</th>
                <th class ="border border-gray-400 px-4 py-2">Nom</th>
                <th class ="border border-gray-400 px-4 py-2">Cognom</th>
                <th class ="border border-gray-400 px-4 py-2">Email</th>
                <th class ="border border-gray-400 px-4 py-2">Phone</th>
                <th class ="border border-gray-400 px-4 py-2">Accions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($jugadors as $jugador)
            <tr>
                <td class ="bg bg-gray-200 border border-gray-500 px-4 py-2">{{$jugador->id}}</td>
                <td class ="bg bg-gray-400 border border-gray-500 px-4 py-2">{{$jugador->nom}}</td>
                <td class ="bg bg-gray-200 border border-gray-500 px-4 py-2">{{$jugador->cognom}}</td>
                <td class ="bg bg-gray-400 border border-gray-500 px-4 py-2">{{$jugador->email}}</td>
                <td class ="bg bg-gray-200 border border-gray-500 px-4 py-2">{{$jugador->phone}}</td>
                <td class = "bg bg-gray-400 border border-gray-500 px-4 py-2r">
                    <div class= "flex">
                        
                        <form action="{{route('jugadors.delete', $jugador)}}" method = "POST">
                            @csrf
                            @method('delete')
                                <button><svg class="h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg></button>
                        </form>
                        
                        <a href="{{route('jugadors.edit', $jugador->id)}}">
                                <svg class="h-6" fill ="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                        </a>
                        
                        <a href="{{route('jugadors.show', $jugador->id)}}">
                            <svg class="h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
                        </a>
                    </div>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
@endsection
