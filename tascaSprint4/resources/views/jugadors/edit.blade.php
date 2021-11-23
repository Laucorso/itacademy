@extends ('layouts.plantillabase')
@section('title', 'Editar Registres')
@section('container')

    <div class ="mt-6 md:w-1/2 px-3 mb-6 md:mb-0">
        <form action= "{{ route('jugadors.update', $jugador->id) }}" method ="POST">
        @method('PUT')
        @csrf

                <label>
                    Nom
                    <input class="w-full bg-gray-200 text-black border border-gray-200 rounded py-3 px-4" name="nom" type="text" value="{{$jugador->nom}}">
                </label>

                @error('nom')
                <br>
                    <strong>*{{ $message }}</strong>
                <br>
                @enderror
            
                <label>
                    Cognom
                    <input class="w-full bg-gray-200 text-black border border-gray-200 rounded py-3 px-4 " name ="cognom" type="text" value="{{$jugador->cognom}}">
                </label>
                    @error('cognom')
                        <br>
                            <strong>*{{ $message }}</strong>
                        <br>
                    @enderror
                <label>
                    Email
                <input class="w-full bg-gray-200 text-black border border-gray-200 rounded py-3 px-4" name="email" type="text" value="{{$jugador->email}}">
                </label>
                @error('email')
                    <br>
                        <strong>*{{ $message }}</strong>
                    <br>
                @enderror
           
                <label>Phone
                <input class="w-full bg-gray-200 text-black border border-gray-200 rounded py-3 px-4" name="phone" type="text" value="{{$jugador->phone}}">
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
