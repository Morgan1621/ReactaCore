using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_DOMAIN
{
    public class Comentaios
    {
        public int ComentarioId { get; set; }
        public int UsuarioId { get; set; }
        public int EventoId { get; set; }

        public string Comentario { get; set; }

        public DateTime Fecha { get; set; }



    }
}
