@extends('layouts.plantillabase')
@section('title', 'Taula completa de Jugadors de la nostre lliga')
@section('container')

<a href = "jugadors/create">
    <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 mt-4 border border-green-800 rounded inline-flex items-center">
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
                <td class = "bg bg-gray-400 border border-gray-500 px-4 py-2">
                    <div class= "flex items-stretch">
                        <form action="{{route('jugadors.delete', $jugador)}}" method = "POST">
                            @csrf
                            @method('delete')
                            <button class="bg-red-500 hover:bg-red-300 text-gray-800 font-bold py-2 px-4 rounded inline-flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-width="2" d="M7.5 9h9v10h-9V9zM5 9h14M9.364 6h5v3h-5V6zm1.181 5v6m3-6v6"/></svg>
                                <span>Eliminar</span>
                            </button>
                        </form>
                            <a href="{{route('jugadors.edit', $jugador->id)}}">
                                <button class="bg-blue-500 hover:bg-blue-300 text-gray-800 font-bold py-2 px-4 rounded inline-flex items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><path d="M19 20H5a1 1 0 0 0 0 2h14a1 1 0 0 0 0-2zM5 18h.09l4.17-.38a2 2 0 0 0 1.21-.57l9-9a1.92 1.92 0 0 0-.07-2.71L16.66 2.6A2 2 0 0 0 14 2.53l-9 9a2 2 0 0 0-.57 1.21L4 16.91a1 1 0 0 0 .29.8A1 1 0 0 0 5 18zM15.27 4L18 6.73l-2 1.95L13.32 6z" fill="currentColor"/></svg>
                                    <span>Editar</span>
                                </button>
                            </a>
                    </div>
                </td>
            </tr>
            @endforeach
        </tbody>
    
    </table>
@endsection
