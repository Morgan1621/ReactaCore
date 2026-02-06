using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.DTOs
{
    public class NotificacionesDTOs
    {


        public int NotificacionId { get; set; }
        public int UsuarioId { get; set; }
        public string Mensaje { get; set; }

        public DateTime Fecha { get; set; }
    }
}
