using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_DOMAIN
{
    public class Bitacora
    {

        public int BitacoraId { get; set; }
        public int UsuarioId { get; set; }
        public string Accion {  get; set; }
        public DateTime Fecha { get; set; }

    }
}
