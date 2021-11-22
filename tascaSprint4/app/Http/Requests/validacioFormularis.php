<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class validacioFormularis extends FormRequest
{
    
    protected $redirectRoute = 'jugadors.create';
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'nom' => 'required|min:3|string',
            'cognom' => 'required',
            'email' => 'required|email',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:9',
        ];
    }


    public function messages()
    {
        return [
            'nom.string' => 'El :attribute no és vàlid',
            'nom.required' => 'El :attribute és obligatori.',
            'nom.min' => 'El :attribute ha de contenir mínim 3 lletres',
            'cognom.required' => 'El :attribute es obligatori.',
            'email.required' => 'El :attribute es obligatori.',
            'phone.required' => 'El :attribute es obligatori.',
            'phone.regex' => 'El :attribute no és vàlid',
            'phone.min' => 'El :attribute ha de contenir mínim 9 números'
    ];

    }
    public function attributes()
    {
        return [
            'nom' => 'nom del producte',
            'cognom' => 'cognom',
            'email' => 'email',
            'phone' => 'telèfon',
    ];
    }
    
}

