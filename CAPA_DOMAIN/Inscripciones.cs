using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_DOMAIN
{
    public class Inscripciones
    {
        public int InscripcionId { get; set; }
        
        public int UsuarioId { get; set; }
        public int EventoId    { get; set; }
        public int EstadoId { get; set; }


    }
}


