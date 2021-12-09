<?php

namespace App\Exceptions;

use Exception;

class JugadorNotFoundException extends Exception
{
    function report()
    {

    }
    function render()
    {
        return response()->view('errors.jugadorNotFound', [], 404);
    }
}
