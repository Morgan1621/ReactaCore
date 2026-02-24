using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IAsistenteRepository
    {

        Task<IEnumerable<Asistente>> ListarAsistenteAsync();

        Task<IEnumerable<Asistente>> ListarAsistentePorNombreAsync();
        Task NuevoAsistenteAsync(Asistente asistente);
        Task EditarAsistenteAsync(Asistente asistente);

        Task EliminarAsistenteAsync(int Id);


    }
}
