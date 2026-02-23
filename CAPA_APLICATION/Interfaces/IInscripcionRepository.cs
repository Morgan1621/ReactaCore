using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IInscripcionRepository
    {
        Task<IEnumerable<Inscripciones>> ListarinscripcionesAsync();

        Task<IEnumerable<Inscripciones>> ListarinscripcionesPorNombreAsync();
        Task NuevoinscripcionesAsync(Inscripciones inscripciones);
        Task EditarinscripcionesAsync(Inscripciones inscripciones);

        Task EliminarinscripcionesAsync(int Id);


    }
}
