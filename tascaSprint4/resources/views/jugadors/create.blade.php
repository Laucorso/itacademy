@extends('layouts.plantillabase')
@section('title','Crea un nou jugador')
@section('container')

<div class ="mt-6 md:w-1/2 px-3 mb-6 md:mb-0">
        <form action= "{{ route('jugadors.store') }}" method ="POST">
        @csrf
        @if(session('jugadorGuardat'))
            <div>
                {{session('jugadorGuardat')}}
            </div>
        @endif
                <label>
                    Nom
                    <input class="w-full bg-gray-200 text-black border border-gray-200 rounded py-3 px-4" name="nom" type="text" value="{{old('nom')}}">
                </label>

                @error('nom')
                <br>
                    <strong>*{{ $message }}</strong>
                <br>
                @enderror
            
                <label>
                    Cognom
                    <input class="w-full bg-gray-200 text-black border border-gray-200 rounded py-3 px-4 " name ="cognom" type="text" value="{{old('cognom')}}">
                </label>
                    @error('cognom')
                        <br>
                            <strong>*{{ $message }}</strong>
                        <br>
                    @enderror
                <label>
                    Email
                <input class="w-full bg-gray-200 text-black border border-gray-200 rounded py-3 px-4" name="email" type="text" value="{{old('email')}}">
                </label>
                @error('email')
                    <br>
                        <strong>*{{ $message }}</strong>
                    <br>
                @enderror
           
                <label>Phone
                <input class="w-full bg-gray-200 text-black border border-gray-200 rounded py-3 px-4" name="phone" type="text" value="{{old('phone')}}">
                </label>
                @error('phone')
                    <br>
                        <strong>*{{ $message }}</strong>
                    <br>
                @enderror

            <div class = "mt-2">
                <a href ="/jugadors" class="bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow">Cancelar</a>
                <button type = "submit"  class="bg-white hover:bg-gray-100 text-green-500 font-semibold py-2 px-4 border border-gray-400 rounded shadow">Guardar</button>
            </div>
        </form>
</div>
@endsection
