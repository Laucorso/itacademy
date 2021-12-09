<?php

namespace App\Exceptions;

use Exception;

class NotFound extends Exception
{
    function report()
    {

    }
    function render()
    {
        return response()->view('errors.NotFound', [], 404);
    }
}
