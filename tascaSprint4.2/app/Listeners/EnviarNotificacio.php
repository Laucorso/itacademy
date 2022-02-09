<?php

namespace App\Listeners;
use App\Events\ValidacioFormularis;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class EnviarNotificacio
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle(ValidacioFormularis $event)
    {
        if ($event ==1){ 
            var_dump("Realitzat amb èxit");//enviar notificacio dexit o fracas
        }else{
            var_dump("S'ha produit un error");
        }
    }
}
