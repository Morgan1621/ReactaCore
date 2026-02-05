using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_DOMAIN
{
    public class Certificados
    {
        public int CertificadoId { get; set; }
        public int AsistenteId { get; set; }
        public int PlantillaId { get; set; }
        public DateTime FechaEmision { get; set; }



    }
}

