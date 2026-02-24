using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IPonentesRepository
    {

        Task<IEnumerable<Ponentes>> ListarPonenteAsync();

        Task<IEnumerable<Ponentes>> ListarPonentePorNombreAsync();
        Task NuevoPonenteAsync(Ponentes ponentes);
        Task EditarPonenteAsync(Ponentes ponentes);

        Task EliminarPonenteAsync(int Id);


    }
}
