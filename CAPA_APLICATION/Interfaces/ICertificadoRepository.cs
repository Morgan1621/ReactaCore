using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface ICertificadoRepository
    {

        Task<IEnumerable<Certificados>> ListarCertificadoAsync();

        Task<IEnumerable<Certificados>> ListarCertificadoPorNombreAsync();
        Task NuevoCertificadoAsync(Certificados certificados);
        Task EditarCertificadoAsync(Certificados certificados);

        Task EliminarCertificadoAsync(int Id);
    }
}
