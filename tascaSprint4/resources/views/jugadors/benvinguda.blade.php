@extends ('layouts.plantillabase')
@section('title', 'Benvinguts')
@section('container')

<div>
    <h1 class = "font-extrabold text-3xl underline mb-2">Benvinguts a la nostre lliga</h1>

    <div class = "m-4 align justify-items-center">
        <a href = "{{route ('jugadors.index')}}" class ="">
            <button class="bg-blue-500 hover:bg-blue-500 text-white font-bold py-2 px-4 border border-blue-500 rounded inline-flex items-center">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path class="clr-i-outline clr-i-outline-path-1" d="M15 8h9v2h-9z" fill="currentColor"/><path class="clr-i-outline clr-i-outline-path-2" d="M15 12h9v2h-9z" fill="currentColor"/><path class="clr-i-outline clr-i-outline-path-3" d="M15 16h9v2h-9z" fill="currentColor"/><path class="clr-i-outline clr-i-outline-path-4" d="M15 20h9v2h-9z" fill="currentColor"/><path class="clr-i-outline clr-i-outline-path-5" d="M15 24h9v2h-9z" fill="currentColor"/><path class="clr-i-outline clr-i-outline-path-6" d="M11 8h2v2h-2z" fill="currentColor"/><path class="clr-i-outline clr-i-outline-path-7" d="M11 12h2v2h-2z" fill="currentColor"/><path class="clr-i-outline clr-i-outline-path-8" d="M11 16h2v2h-2z" fill="currentColor"/><path class="clr-i-outline clr-i-outline-path-9" d="M11 20h2v2h-2z" fill="currentColor"/><path class="clr-i-outline clr-i-outline-path-10" d="M11 24h2v2h-2z" fill="currentColor"/><path d="M28 2H8a2 2 0 0 0-2 2v28a2 2 0 0 0 2 2h20a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zm0 30H8V4h20z" class="clr-i-outline clr-i-outline-path-11" fill="currentColor"/></svg>
                <span>Accedeix a la llista dels jugadors</span>
            </button>
        </a>

    </div>
</div>
        



@endsection