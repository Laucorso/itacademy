<?php

namespace App\Http\Controllers;
use App\Models\Jugador;
use Illuminate\Http\Request;

class JugadorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('data');

    }

    public function index()
    {
        $jugadors = Jugador::all();
        return view('jugadors.index', compact('jugadors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('jugadors.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([
            'nom' => 'required|min:3|string',
            'cognom' => 'required',
            'email' => 'required|email',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:9',
        ]);

        $jugador = new Jugador;
        $jugador -> nom = $request->nom;
        $jugador -> cognom = $request->cognom;
        $jugador -> email = $request->email;
        $jugador -> phone = $request->phone;
        $jugador -> save();

        return redirect()->route('jugadors.index',$jugador);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {   
        $jugador = Jugador::find($id);
        return view('jugadors.show', compact('jugador'));
    }
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $jugador = Jugador::find($id);
        return view('jugadors.edit', compact ('jugador'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'nom' => 'required|min:3|string',
            'cognom' => 'required',
            'email' => 'required|email',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:9',
        ]);

        $jugador = Jugador::find($id);
        $jugador -> nom = $request->input('nom');
        $jugador -> cognom = $request->input('cognom');
        $jugador -> email = $request->input('email');
        $jugador -> phone = $request->input('phone');
        $jugador->save();
        return redirect()->route('jugadors.index');
      
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Jugador $jugador)
    {
        $jugador ->delete();
        return redirect()->route('jugadors.index');
    }
}
