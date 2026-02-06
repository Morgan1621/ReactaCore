using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.DTOs
{
    public class EventosDTOs
    {


        public int EventoId { get; set; }
        public string NombreEvento { get; set; }
        public DateTime Fecha { get; set; }
        public int CategoriaId { get; set; }
        public int OrganizadorId { get; set; }
        public int EstadoId { get; set; }
    }
}
